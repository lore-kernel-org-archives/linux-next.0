From: Anca Emanuel <anca.emanuel@gmail.com>
Subject: Re: linux-next: Tree for December 29
Date: Wed, 29 Dec 2010 10:58:02 +0200
Message-ID: <AANLkTin1pizZM5LttTpYQOo0gPEeV7Jd5uD5RXwnj37Z@mail.gmail.com>
References: <20101229130700.0ef93735.sfr@canb.auug.org.au>
	<AANLkTikq50KLGwS1_=uA=TXz2b=LNzr_TKUSiZu-an1m@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTikq50KLGwS1_=uA=TXz2b=LNzr_TKUSiZu-an1m@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

  Building modules, stage 2.
  MODPOST 2808 modules
ERROR: "__tracepoint_snd_soc_jack_irq"
[sound/soc/codecs/snd-soc-wm8994.ko] undefined!
ERROR: "__tracepoint_snd_soc_jack_irq"
[sound/soc/codecs/snd-soc-wm8350.ko] undefined!
ERROR: "__tracepoint_snd_soc_jack_irq"
[sound/soc/codecs/snd-soc-88pm860x.ko] undefined!
WARNING: modpost: Found 59 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=y'
make[2]: *** [__modpost] Error 1
make[1]: *** [modules] Error 2
