From: Joerg Roedel <joerg.roedel@amd.com>
Subject: Re: linux-next: x86 tree build failure
Date: Fri, 12 Sep 2008 08:05:27 +0200
Message-ID: <20080912060527.GA22003@amd.com>
References: <20080912095618.728658a5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-va3.frontbridge.com ([216.32.180.16]:44183 "EHLO
	VA3EHSOBE006.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750701AbYILGIA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Sep 2008 02:08:00 -0400
Content-Disposition: inline
In-Reply-To: <20080912095618.728658a5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org

Hi Stephen,

do you have these commits in next/master already? I tried to find out
why it fails (the build failure is weird because
PCI_DEVICE_ID_AMD_10H_NB_MISC and PCI_DEVICE_ID_AMD_11H_NB_MISC
are defined in the same place in tip/master).

Joerg

On Fri, Sep 12, 2008 at 09:56:18AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> arch/x86/kernel/k8.c:20: error: 'PCI_DEVICE_ID_AMD_10H_NB_MISC' undeclared here (not in a function)
> 
> Introduced by commit cf169702ba6928cee9d4f4adf3e932b643b8db7a ("x86,
> gart: add detection of AMD family 0x11 northbridges").  I applied the
> following patch.
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 12 Sep 2008 09:52:19 +1000
> Subject: [PATCH] x86: fix arch/x86/kernel/k8.c
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/x86/kernel/k8.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/x86/kernel/k8.c b/arch/x86/kernel/k8.c
> index 304d8ba..3f5b832 100644
> --- a/arch/x86/kernel/k8.c
> +++ b/arch/x86/kernel/k8.c
> @@ -17,7 +17,7 @@ static u32 *flush_words;
>  
>  struct pci_device_id k8_nb_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_K8_NB_MISC) },
> -	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_10H_NB_MISC) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x1203) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_11H_NB_MISC) },
>  	{}
>  };
> -- 
> 1.5.6.3
> 
> 

-- 
           |           AMD Saxony Limited Liability Company & Co. KG
 Operating |         Wilschdorfer Landstr. 101, 01109 Dresden, Germany
 System    |                  Register Court Dresden: HRA 4896
 Research  |              General Partner authorized to represent:
 Center    |             AMD Saxony LLC (Wilmington, Delaware, US)
           | General Manager of AMD Saxony LLC: Dr. Hans-R. Deppe, Thomas McCoy
