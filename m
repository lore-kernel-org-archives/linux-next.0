From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: linux-next: Fixes tag needs some work in the pci tree
Date: Wed, 13 Feb 2019 09:55:57 +0000
Message-ID: <20190213095557.GA23223@e107981-ln.cambridge.arm.com>
References: <20190213100309.03b5ea58@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190213100309.03b5ea58@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wen Yang <wen.yang99@zte.com.cn>
List-Id: linux-next.vger.kernel.org

On Wed, Feb 13, 2019 at 10:03:09AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   593425276b94 ("PCI: endpoint: functions: Use memcpy_fromio()/memcpy_toio()")
> 
> Fixes tag
> 
>   Fixes: 349e7a85b25f ("PCI: endpoint: functions: Add an EP function to
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tags over more than 1 line.

It is my mistake, apologies, I will fix the commit log up.

Thanks,
Lorenzo
