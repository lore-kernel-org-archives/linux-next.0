From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Jun 7 (staging/ccg)
Date: Thu, 07 Jun 2012 09:30:28 -0700
Message-ID: <4FD0D724.40308@xenotime.net>
References: <20120607131802.d90de854f06c5530c5fb2b33@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120607131802.d90de854f06c5530c5fb2b33@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Mike Lockwood <lockwood@android.com>, devel@driverdev.osuosl.org
List-Id: linux-next.vger.kernel.org

On 06/06/2012 08:18 PM, Stephen Rothwell wrote:

> Hi all,
> 
> For the fist time in my memory, today's linux-next build required no
> manual intervention i.e. there are no new conflicts or build problems.
> 
> Changes since 20120604:


on x86_64:

In file included from drivers/staging/ccg/ccg.c:59:0:
drivers/staging/ccg/../../usb/gadget/f_fs.c:40:0: warning: "pr_vdebug" redefined
drivers/staging/ccg/../../usb/gadget/u_serial.c:138:0: note: this is the location of the previous definition

-- 
~Randy
