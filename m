From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Thu, 21 Jun 2012 00:54:56 +0200
Message-ID: <201206210054.56235.rjw@sisk.pl>
References: <20120620150140.64b8bd622e00638d3ceed40c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120620150140.64b8bd622e00638d3ceed40c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Nanda <snanda@chromium.org>, "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Wednesday, June 20, 2012, Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/built-in.o:(.toc1+0x37f0): undefined reference to `pm_print_times_enabled'
> 
> Caused by commit 0eb8c06cb620 ("PM / Sleep: Separate printing suspend
> times from initcall_debug") or maybe 1873ce64491a ("M / Sleep: add knob
> for printing device resume times").

That should be fixed now, sorry for the breakage.

Thanks,
Rafael
