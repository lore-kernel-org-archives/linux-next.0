From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH pci-2.6#linux-next] pci: pci_dfl_cache_line_size is
 __devinitdata
Date: Thu, 8 Oct 2009 10:25:42 -0700
Message-ID: <20091008102542.4006c04c@jbarnes-g45>
References: <20091008152725.1351485a.sfr@canb.auug.org.au>
	<4ACDB819.4060606@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932861AbZJHR0g@vger.kernel.org>
In-Reply-To: <4ACDB819.4060606@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 08 Oct 2009 18:59:53 +0900
Tejun Heo <tj@kernel.org> wrote:

> pci_dfl_cache_line_size is marked as __initdata but referenced by
> pci_init() which is __devinit.  Make it __devinitdata instead of
> __initdata.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/pci/pci.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 1ae95df..a6e22fd 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -53,7 +53,7 @@ unsigned long pci_hotplug_mem_size =
> DEFAULT_HOTPLUG_MEM_SIZE;
>   * the dfl or actual value as it sees fit.  Don't forget this is
>   * measured in 32-bit words, not bytes.
>   */
> -u8 pci_dfl_cache_line_size __initdata = L1_CACHE_BYTES >> 2;
> +u8 pci_dfl_cache_line_size __devinitdata = L1_CACHE_BYTES >> 2;
>  u8 pci_cache_line_size;

Fix pushed, thanks for the quick turnaround Tejun.

-- 
Jesse Barnes, Intel Open Source Technology Center
