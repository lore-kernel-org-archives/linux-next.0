From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the final tree (suspend tree related)
Date: Tue, 24 May 2011 23:40:20 +0200
Message-ID: <201105242340.21104.rjw@sisk.pl>
References: <20110524134216.1033c885.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110524134216.1033c885.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tuesday, May 24, 2011, Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> kernel/swsusp.c:13:25: error: asm/suspend.h: No such file or directory
> kernel/power/hibernate.c:28:25: error: asm/suspend.h: No such file or directory
> 
> Caused by commit 8f6404f39725 ("PM / Hibernate: Remove
> arch_prepare_suspend()" which completely removed asm/suspend.h on
> powerpc, frv and s390.
> 
> I have reverted that commit for today.

Thanks for handling that, it should be fixed now.

Rafael
