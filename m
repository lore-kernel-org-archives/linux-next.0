From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
Date: Fri, 27 Aug 2010 03:51:48 +0100
Message-ID: <20100827025148.GA25469@srcf.ucam.org>
References: <20100827115950.dd942b90.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100827115950.dd942b90.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: linux-next.vger.kernel.org

On Fri, Aug 27, 2010 at 11:59:50AM +1000, Stephen Rothwell wrote:

> After merging the drivers-x86 tree, today's linux-next build (powerpc
> ppc64_defconfig and x86_64 allmodconfig) produced this warning:

Oh Lordy. I should stop merging anything that contains "select". I'll 
take a look at this tomorrow, but I'm about to head away for a week - if 
anyone has a fix, feel free to find a way to get it merged.

(Dmitry, there was a Kconfig issue when I merged your patch, so it's 
entirely plausible that you're a completely innocent bystander here)

-- 
Matthew Garrett | mjg59@srcf.ucam.org
