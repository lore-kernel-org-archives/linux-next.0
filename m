From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: mmotm 2012-09-06-16-46 uploaded (fs/binfmt_aout)
Date: Fri, 07 Sep 2012 16:45:11 -0700
Message-ID: <504A8707.8080507@xenotime.net>
References: <20120906234735.1B54B20004E@hpza10.eem.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120906234735.1B54B20004E@hpza10.eem.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 09/06/2012 04:47 PM, akpm@linux-foundation.org wrote:

> The mm-of-the-moment snapshot 2012-09-06-16-46 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 


when CONFIG_COREDUMP is not enabled:

ERROR: "dump_seek" [fs/binfmt_aout.ko] undefined!
ERROR: "dump_write" [fs/binfmt_aout.ko] undefined!

-- 
~Randy
