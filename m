From: Jim Davis <jim.epost@gmail.com>
Subject: make allyesconfig i386 build failure with next-20150122
Date: Thu, 22 Jan 2015 12:10:33 -0700
Message-ID: <CA+r1ZhhXF+hicy7JKo3jAbgSbO4KOLm6BwPosTKNb+E_Cb4yPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel <devel@driverdev.osuosl.org>, isdn@linux-pingi.de, netdev <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

make ARCH=i386 allyesconfig fails with

drivers/staging/built-in.o: In function `reset':
(.text+0x2ae89d): multiple definition of `reset'
drivers/isdn/built-in.o:(.text+0x185dc2): first defined here
make[1]: *** [drivers/built-in.o] Error 1
