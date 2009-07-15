From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: pci tree build failure
Date: Wed, 15 Jul 2009 09:09:13 -0700
Message-ID: <20090715090913.5dfb96c2@jbarnes-g45>
References: <20090715114510.ebba4bd0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-126.bluehost.com ([67.222.38.26]:36114 "HELO
	outbound-mail-126.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S932117AbZGOQJR (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Jul 2009 12:09:17 -0400
In-Reply-To: <20090715114510.ebba4bd0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, Jesse Brandeburg <jesse.brandeburg@gmail.com>

On Wed, 15 Jul 2009 11:45:10 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jesse,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> arch/x86/pci/common.c:619: error: expected '}' before ';' token
> 
> Caused by commit 1c6804b093f5753c2a23aa36f31f66966035bd32 ("x86/PCI:
> initialize PCI bus node numbers early").  This could not have been
> built with CONFIG_NUMA set ...
> 
> I have used the version of the pci tree from next-20090714 for today.

Arg, did I apply the patch w/o that fix?  Fixing now...

-- 
Jesse Barnes, Intel Open Source Technology Center
