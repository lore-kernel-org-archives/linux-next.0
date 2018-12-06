From: Mike Snitzer <snitzer@redhat.com>
Subject: Re: linux-next: build failure after merge of the device-mapper tree
Date: Thu, 6 Dec 2018 08:41:06 -0500
Message-ID: <20181206134105.GA14624@redhat.com>
References: <20181206172128.71293ced@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206172128.71293ced@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mikulas Patocka <mpatocka@redhat.com>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 06 2018 at  1:21am -0500,
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the device-mapper tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:
... 
> Caused by commit
> 
>   3a657cf59109 ("block: switch to per-cpu in-flight counters")
> 
> This build does not have CONFIG_SMP set and part->dkstats is not a
> pointer in this case.
> 
> I have reverted the device-mapper tree changes for today.

Sorry for the trouble.  I'll get this fixed up.

Thanks,
Mike
