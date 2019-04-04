From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Fixes tag needs some work in the hwmon-staging tree
Date: Thu, 4 Apr 2019 14:26:18 -0700
Message-ID: <20190404212618.GA20949@roeck-us.net>
References: <20190405075438.12f98275@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190405075438.12f98275@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Apr 05, 2019 at 07:54:38AM +1100, Stephen Rothwell wrote:
> Hi Guenter,
> 
> In commit
> 
>   742ad88f0440 ("hwmon: (smsc47b397) Use request_muxed_region for Super-IO accesses")
> 
> Fixes tag
> 
>   Fixes: 8d5d45fb1468 ("I2C: Move hwmon drivers (2/3)")
> 
The original subject is "[PATCH] I2C: Move hwmon drivers (2/3)", and
I consider it quite pointless to include the "[PATCH] " prefix.
Same for the other tag.

Guenter

> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h (%s)'
> 
> In commit
> 
>   4d730440042d ("hwmon: (smsc47b397) Use request_muxed_region for Super-IO accesses")
> 
> Fixes tag
> 
>   Fixes: 8d5d45fb1468 ("I2C: Move hwmon drivers (2/3)")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h (%s)'
> 
> In commit
> 
>   2f38d5d31508 ("hwmon: (f71805f) Use request_muxed_region for Super-IO accesses")
> 
> Fixes tag
> 
>   Fixes: e53004e20a58e ("hwmon: New f71805f driver")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h (%s)'
> 
> -- 
> Cheers,
> Stephen Rothwell
