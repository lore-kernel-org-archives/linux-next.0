From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the csky tree with Linus' tree
Date: Mon, 7 Jan 2019 07:53:44 +0100
Message-ID: <20190107065344.GA11989@lst.de>
References: <20190107102727.0c67e3d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190107102727.0c67e3d7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Guo Ren <ren_guo@c-sky.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Mon, Jan 07, 2019 at 10:27:27AM +1100, Stephen Rothwell wrote:
> You want to add "select ARCH_NO_SG_CHAIN" to your Kconfig somewhere
> (see the commit from Linus' tree above).

No, csky should not select it.  There is no code directly poking
into scatterlists internals in csky, so it can safely enable chained
sglists.
