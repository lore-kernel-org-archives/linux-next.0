From: Alan Ott <alan@signal11.us>
Subject: Re: linux-next: build failure after merge of the hid tree
Date: Thu, 07 Apr 2011 09:00:16 -0400
Message-ID: <4D9DB560.7000200@signal11.us>
References: <20110407110626.397202fb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110407110626.397202fb.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jikos@jikos.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, Jonathan Corbet <corbet@lwn.net>
List-Id: linux-next.vger.kernel.org

On 04/06/2011 09:06 PM, Stephen Rothwell wrote:
> After merging the hid tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> samples/hidraw/hid-example.c: In function 'main':
> samples/hidraw/hid-example.c:103: warning: implicit declaration of function 'HIDIOCSFEATURE'
> samples/hidraw/hid-example.c:111: warning: implicit declaration of function 'HIDIOCGFEATURE'
> tmp/ccK96SHd.o: In function `main':
> hid-example.c:(.text+0x205): undefined reference to `HIDIOCSFEATURE'
> hid-example.c:(.text+0x23e): undefined reference to `HIDIOCGFEATURE'
>
> Caused by commit c54ea4918c2b ("HID: Documentation for hidraw").  I can
> only assume that linux/hidraw.h is being included from /usr/include and
> not the kernel tree being built?

Hi Stephen,

That sounds like a reasonable explanation. What's the right way to do
this? I suppose I had incorrectly assumed that the include path would be
set by the build system to the kernel tree being built. The other
samples seem to do the same thing (simply #including whatever they
need), and don't seem to do anything special with include paths to make
it use the current tree.

Maybe Randy can shed some light.

Sorry for the bother,

Alan.
