From: David Rientjes <rientjes@google.com>
Subject: Re: linux-next: Tree for May 1 (media/usb/stk1160)
Date: Wed, 1 May 2013 13:40:27 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1305011337430.14366@chino.kir.corp.google.com>
References: <20130501183734.7ad1efca2d06e75432edabbd@canb.auug.org.au> <518157EB.3010700@infradead.org> <20130501192845.GA18811@free.fr> <alpine.DEB.2.02.1305011258180.8448@chino.kir.corp.google.com> <518179BD.3010407@infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <518179BD.3010407@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, linux-kbuild@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 1 May 2013, Randy Dunlap wrote:

> >>> When CONFIG_SND=m and CONFIG_SND_AC97_CODEC=m and
> >>> CONFIG_VIDEO_STK1160=y
> >>> CONFIG_VIDEO_STK1160_AC97=y
> >>>
> >>> drivers/built-in.o: In function `stk1160_ac97_register':
> >>> (.text+0x122706): undefined reference to `snd_card_create'
> >>> drivers/built-in.o: In function `stk1160_ac97_register':
> >>> (.text+0x1227b2): undefined reference to `snd_ac97_bus'
> >>> drivers/built-in.o: In function `stk1160_ac97_register':
> >>> (.text+0x1227cd): undefined reference to `snd_card_free'
> >>> drivers/built-in.o: In function `stk1160_ac97_register':
> >>> (.text+0x12281b): undefined reference to `snd_ac97_mixer'
> >>> drivers/built-in.o: In function `stk1160_ac97_register':
> >>> (.text+0x122832): undefined reference to `snd_card_register'
> >>> drivers/built-in.o: In function `stk1160_ac97_unregister':
> >>> (.text+0x12285e): undefined reference to `snd_card_free'
> >>>
> >>>
> >>> This kconfig fragment:
> >>> config VIDEO_STK1160_AC97
> >>> 	bool "STK1160 AC97 codec support"
> >>> 	depends on VIDEO_STK1160 && SND
> > 
> > This doesn't depend on SND, it depends on SND=y.
> > --
> 
> 
> Maybe this option *should* depend on SND=y, but that's not what the
> kconfig syntax says.  The kconfig language does not care if the variable is
> a bool or a tristate when evaluating a depends expression AFAICT (but I am
> only reading Documentation/kbuild/kconfig-language.txt, not the source code).
> 

Doing "depends on SND=y" will only allow an option to be enabled if SND is 
builtin so the snd_card_* functions above will be defined (with your 
config we have a builtin function calling a module which may or may not be 
loaded).  I think you've already addressed the snd_ac97_* functions, so 
the fix here should be relatively simple.  Yann?
