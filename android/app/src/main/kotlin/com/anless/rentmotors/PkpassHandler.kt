package com.anless.rentmotors
import java.io.File
import java.net.URL
import android.os.Looper
import android.os.Handler
import java.io.IOException
import android.app.Activity
import android.content.Context
import android.content.Intent
import java.io.FileOutputStream
import java.net.HttpURLConnection
import androidx.annotation.NonNull
import androidx.core.content.FileProvider
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

class PkpassHandler : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private var activity: Activity? = null
    private var context: Context? = null

    private fun getAndroidVersionCode(): Int {
        return context?.packageManager?.getPackageInfo(context!!.packageName, 0)?.versionCode ?: 1
    }

    override fun onAttachedToEngine(
        @NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "pkpass_util")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        context = binding.activity.applicationContext
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getAppVersion" -> {
                val versionCode = getAndroidVersionCode()
                result.success(versionCode.toString())
            }
            "downloadAndOpenPkpass" -> {
                val url = call.argument<String>("url") ?: ""
                val headers = call.argument<Map<String, String>>("headers") ?: mapOf()

                Thread {
                    try {
                        val conn = URL(url).openConnection() as HttpURLConnection
                        headers.forEach { conn.setRequestProperty(it.key, it.value) }
                        val inputStream = conn.inputStream
                        val file = File(activity?.getExternalFilesDir(null), "temp.pkpass")
                        val outputStream = FileOutputStream(file)
                        inputStream.copyTo(outputStream)

                        Handler(Looper.getMainLooper()).post {
                            val uri = FileProvider.getUriForFile(
                                activity!!,
                                BuildConfig.APPLICATION_ID + ".fileprovider",
                                file
                            )
                            val intent = Intent(Intent.ACTION_VIEW)
                            intent.data = uri
                            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                            val chooserIntent = Intent.createChooser(intent, "Open file with:")
                            activity?.startActivity(chooserIntent)
                            result.success(null)
                        }
                    } catch (e: IOException) {
                        result.error(
                            "download_error",
                            "Failed to download or open the pkpass file.",
                            null
                        )
                    }
                }.start()
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}