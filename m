From: David Woodhouse <david.woodhouse@intel.com>
Subject: Re: linux-next: manual merge of the pci tree with Linus' tree
Date: Wed, 14 Oct 2009 08:41:46 +0100
Message-ID: <1255506106.4523.79.camel@macbook.infradead.org>
References: <20091014110532.f543b915.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757091AbZJNHm1@vger.kernel.org>
In-Reply-To: <20091014110532.f543b915.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, 2009-10-14 at 01:05 +0100, Stephen Rothwell wrote:
> ++device_initcall(pci_init); 

That puts it _after_ some device drivers have already started up.
Possibly not what was intended?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
