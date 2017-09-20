From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the sound-asoc tree
Date: Wed, 20 Sep 2017 12:01:51 +1000
Message-ID: <20170920120151.3d7d97b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the sound-asoc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

sound/soc/codecs/wm9712.c: In function 'wm9712_soc_probe':
sound/soc/codecs/wm9712.c:675:12: error: invalid storage class for function 'wm9712_soc_remove'
 static int wm9712_soc_remove(struct snd_soc_codec *codec)
            ^
sound/soc/codecs/wm9712.c:675:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
 static int wm9712_soc_remove(struct snd_soc_codec *codec)
 ^
sound/soc/codecs/wm9712.c:690:13: error: initializer element is not constant
  .remove =  wm9712_soc_remove,
             ^
sound/soc/codecs/wm9712.c:690:13: note: (near initialization for 'soc_codec_dev_wm9712.remove')
sound/soc/codecs/wm9712.c:705:12: error: invalid storage class for function 'wm9712_probe'
 static int wm9712_probe(struct platform_device *pdev)
            ^
sound/soc/codecs/wm9712.c:722:12: error: invalid storage class for function 'wm9712_remove'
 static int wm9712_remove(struct platform_device *pdev)
            ^
sound/soc/codecs/wm9712.c:733:11: error: initializer element is not constant
  .probe = wm9712_probe,
           ^
sound/soc/codecs/wm9712.c:733:11: note: (near initialization for 'wm9712_codec_driver.probe')
sound/soc/codecs/wm9712.c:734:12: error: initializer element is not constant
  .remove = wm9712_remove,
            ^
sound/soc/codecs/wm9712.c:734:12: note: (near initialization for 'wm9712_codec_driver.remove')
In file included from sound/soc/codecs/wm9712.c:18:0:
sound/soc/codecs/wm9712.c:737:24: error: invalid storage class for function 'wm9712_codec_driver_init'
 module_platform_driver(wm9712_codec_driver);
                        ^
include/linux/device.h:1500:19: note: in definition of macro 'module_driver'
 static int __init __driver##_init(void) \
                   ^
sound/soc/codecs/wm9712.c:737:1: note: in expansion of macro 'module_platform_driver'
 module_platform_driver(wm9712_codec_driver);
 ^
In file included from sound/soc/codecs/wm9712.c:16:0:
include/linux/module.h:129:42: error: invalid storage class for function '__inittest'
  static inline initcall_t __maybe_unused __inittest(void)  \
                                          ^
include/linux/device.h:1504:1: note: in expansion of macro 'module_init'
 module_init(__driver##_init); \
 ^
include/linux/platform_device.h:228:2: note: in expansion of macro 'module_driver'
  module_driver(__platform_driver, platform_driver_register, \
  ^
sound/soc/codecs/wm9712.c:737:1: note: in expansion of macro 'module_platform_driver'
 module_platform_driver(wm9712_codec_driver);
 ^
sound/soc/codecs/wm9712.c:737:1: warning: 'alias' attribute ignored [-Wattributes]
In file included from sound/soc/codecs/wm9712.c:18:0:
sound/soc/codecs/wm9712.c:737:24: error: invalid storage class for function 'wm9712_codec_driver_exit'
 module_platform_driver(wm9712_codec_driver);
                        ^
include/linux/device.h:1505:20: note: in definition of macro 'module_driver'
 static void __exit __driver##_exit(void) \
                    ^
sound/soc/codecs/wm9712.c:737:1: note: in expansion of macro 'module_platform_driver'
 module_platform_driver(wm9712_codec_driver);
 ^
include/linux/device.h:1505:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
 static void __exit __driver##_exit(void) \
 ^
include/linux/platform_device.h:228:2: note: in expansion of macro 'module_driver'
  module_driver(__platform_driver, platform_driver_register, \
  ^
sound/soc/codecs/wm9712.c:737:1: note: in expansion of macro 'module_platform_driver'
 module_platform_driver(wm9712_codec_driver);
 ^
In file included from sound/soc/codecs/wm9712.c:16:0:
include/linux/module.h:135:42: error: invalid storage class for function '__exittest'
  static inline exitcall_t __maybe_unused __exittest(void)  \
                                          ^
include/linux/device.h:1509:1: note: in expansion of macro 'module_exit'
 module_exit(__driver##_exit);
 ^
include/linux/platform_device.h:228:2: note: in expansion of macro 'module_driver'
  module_driver(__platform_driver, platform_driver_register, \
  ^
sound/soc/codecs/wm9712.c:737:1: note: in expansion of macro 'module_platform_driver'
 module_platform_driver(wm9712_codec_driver);
 ^
sound/soc/codecs/wm9712.c:737:1: warning: 'alias' attribute ignored [-Wattributes]
In file included from include/linux/module.h:18:0,
                 from sound/soc/codecs/wm9712.c:16:
include/linux/moduleparam.h:21:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
 static const char __UNIQUE_ID(name)[]       \
 ^
include/linux/module.h:160:32: note: in expansion of macro '__MODULE_INFO'
 #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
                                ^
include/linux/module.h:207:42: note: in expansion of macro 'MODULE_INFO'
 #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _description)
                                          ^
sound/soc/codecs/wm9712.c:739:1: note: in expansion of macro 'MODULE_DESCRIPTION'
 MODULE_DESCRIPTION("ASoC WM9711/WM9712 driver");
 ^
sound/soc/codecs/wm9712.c:741:1: error: expected declaration or statement at end of input
 MODULE_LICENSE("GPL");
 ^
sound/soc/codecs/wm9712.c: At top level:
sound/soc/codecs/wm9712.c:637:12: warning: 'wm9712_soc_probe' defined but not used [-Wunused-function]
 static int wm9712_soc_probe(struct snd_soc_codec *codec)
            ^

Caused by commit

  2ed1a8e0ce8d ("ASoC: wm9712: add ac97 new bus support")

I have used the sound-asoc tree from next-20170919 for today.

-- 
Cheers,
Stephen Rothwell
