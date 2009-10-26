From: Jesse Barnes <jesse.barnes@intel.com>
Subject: Re: [PATCH pci-2.6#linux-next] pci: pci_dfl_cache_line_size is
 __devinitdata
Date: Mon, 26 Oct 2009 13:40:13 -0700
Message-ID: <20091026134013.43a50cb2@jbarnes-g45>
References: <20091008152725.1351485a.sfr@canb.auug.org.au>
	<4ACDB819.4060606@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756274AbZJZUkT@vger.kernel.org>
In-Reply-To: <4ACDB819.4060606@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
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

Applied to my linux-next tree, thanks.

-- 
Jesse Barnes, Intel Open Source Technology Center
