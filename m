From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the final tree (driver-core tree related)
Date: Tue, 10 May 2011 00:19:52 +0200
Message-ID: <201105100019.52936.rjw@sisk.pl>
References: <20110509145854.9e6d8806.sfr@canb.auug.org.au> <BANLkTinzFs0cfGdmkdOE8cgKSHK=5NEjmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BANLkTinzFs0cfGdmkdOE8cgKSHK=5NEjmg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kay Sievers <kay.sievers@vrfy.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anton Guda <atu@dmeti.dp.ua>
List-Id: linux-next.vger.kernel.org

On Monday, May 09, 2011, Kay Sievers wrote:
> On Mon, May 9, 2011 at 06:58, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > After merging the final tree, today's linux-next build (powerpc allnoconfig)
> > failed like this:
> >
> > kernel/sys.c: In function 'kernel_restart_prepare':
> > kernel/sys.c:317: error: implicit declaration of function 'usermodehelper_disable'
> 
> Rafael, seems usermodehelper_disable() depends on CONFIG_PM_SLEEP.
> 
> Any reason for that conditional? Remove it now?

Aw, we have two conflicting changes.  Could you prepare a patch on top of:

git://git.kernel.org/pub/scm/linux/kernel/git/rafael/suspend-2.6.git pm-next

removing that #ifdef?  That needs to be done in kmod.h too.

Thanks,
Rafael
