From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the suspend tree
Date: Thu, 5 May 2011 22:02:46 +0200
Message-ID: <201105052202.46364.rjw@sisk.pl>
References: <20110505121117.3b9b3fb3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110505121117.3b9b3fb3.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Valdis Kletnieks <valdis.kletnieks@vt.edu>
List-Id: linux-next.vger.kernel.org

On Thursday, May 05, 2011, Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the suspend tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "usermodehelper_is_disabled" [drivers/base/firmware_class.ko] undefined!
> 
> Caused by commit d5fef1145404 ("PM: Print a warning if firmware is
> requested when tasks are frozen").

Hmm.  If that's what I think (a missing EXPORT_SYMBOL), it should be
fixed now.

Thanks,
Rafael
