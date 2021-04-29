package com.example.flutter_app_demo

import android.app.Activity
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.common.BasicMessageChannel
import java.util.*
import kotlin.concurrent.timerTask
class BasicMessageChannelDemo(var activity: Activity, messenger: BinaryMessenger) : BasicMessageChannel.MessageHandler<Any> {

    private var channel: BasicMessageChannel<Any>;

    private var count = 0

    init {
        channel = BasicMessageChannel(messenger, "com.flutter.guide.BasicMessageChannel", StandardMessageCodec())
        channel.setMessageHandler(this)
        startTimer()
    }

    fun startTimer() {
        var timer = Timer().schedule(timerTask {
            activity.runOnUiThread {
                var map = mapOf("count" to count++)
                channel.send(map,object :BasicMessageChannel.Reply<Any>{
                    override fun reply(reply: Any?) {

                    }
                })
            }
        }, 0, 1000)

    }

    override fun onMessage(message: Any?, reply: BasicMessageChannel.Reply<Any>) {
        val name = (message as Map<String, Any>)["name"]
        val age = (message as Map<String, Any>)["age"]

        var map = mapOf("name" to "hello,$name",
                "age" to "$age"
        )

        reply.reply(map)
    }
}
