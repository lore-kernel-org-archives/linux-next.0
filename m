From: Joseph Lo <josephl@nvidia.com>
Subject: Re: CPU hotplug hang due to "swap: make each swap partition have
 one address_space"
Date: Mon, 4 Feb 2013 12:45:44 +0800
Message-ID: <1359953144.5542.2.camel@jlo-ubuntu-64.nvidia.com>
References: <510C9DE9.9040207@wwwdotorg.org>
	 <20130204023646.GA321@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20130204023646.GA321@kernel.org>
Sender: owner-linux-mm@kvack.org
To: Shaohua Li <shli@kernel.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Shaohua Li <shli@fusionio.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rik van Riel <riel@redhat.com>, Minchan Kim <minchan@kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2013-02-04 at 10:36 +0800, Shaohua Li wrote:
> On Fri, Feb 01, 2013 at 10:02:33PM -0700, Stephen Warren wrote:
> > Shaohua,
> > 
> > In next-20130128, commit 174f064 "swap: make each swap partition have
> > one address_space" (from the mm/akpm tree) appears causes a hang/RCU
> > stall for me when hot-unplugging a CPU.
> 
> does this one work for you?
> http://marc.info/?l=linux-mm&m=135929599505624&w=2
> Or try a more recent linux-next. The patch is in akpm's tree.
> 
Hi Shaohua,

The patch you pointed out did fix the issue. Just verified on Tegra
device.

Thanks,
Joseph


--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
