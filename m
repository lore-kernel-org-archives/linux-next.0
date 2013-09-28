From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree
 (char-misc tree related)
Date: Fri, 27 Sep 2013 18:04:44 -0700
Message-ID: <20130928010444.GC22939@kroah.com>
References: <20130927184804.ddb460377bcd3fb35f8b41d2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130927184804.ddb460377bcd3fb35f8b41d2@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sudeep Dutt <sudeep.dutt@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Caz Yokoyama <Caz.Yokoyama@intel.com>, Dasaratharaman Chandramouli <dasaratharaman.chandramouli@intel.com>, Nikhil Rao <nikhil.rao@intel.com>, Harshavardhan R Kharche <harshavardhan.r.kharche@intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Sep 27, 2013 at 06:48:04PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/misc/mic/card/mic_x100.c: In function 'mic_init':
> drivers/misc/mic/card/mic_x100.c:215:9: error: implicit declaration of function 'cpu_data' [-Werror=implicit-function-declaration]
>   struct cpuinfo_x86 *c = &cpu_data(0);
>          ^

<snip>

Should now be fixed, thanks.

greg k-h
