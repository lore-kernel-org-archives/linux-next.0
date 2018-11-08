From: Joerg Roedel <joro@8bytes.org>
Subject: Re: linux-next: build warning after merge of the iommu tree
Date: Thu, 8 Nov 2018 10:30:30 +0100
Message-ID: <20181108093030.GD19831@8bytes.org>
References: <20181108123938.2026559e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181108123938.2026559e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jacob Pan <jacob.jun.pan@linux.intel.com>, Ashok Raj <ashok.raj@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, Nov 08, 2018 at 12:39:38PM +1100, Stephen Rothwell wrote:
> Introduced by commit
> 
>   248808a0fad0 ("iommu/vt-d: Respect max guest address width in agaw")

Thanks for the report! That commit was revoked by the submitter and is
now removed from the tree. The warning should disappear in the next
merge.

Regards,

	Joerg
