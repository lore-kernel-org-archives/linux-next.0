From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: build failure after merge of the slave-dma tree
Date: Mon, 7 Jan 2013 06:00:12 -0800
Message-ID: <20130107140012.GG18119@intel.com>
References: <20130107112637.71699f7daefcccc9ab94d5cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130107112637.71699f7daefcccc9ab94d5cf@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jan 07, 2013 at 11:26:37AM +1100, Stephen Rothwell wrote:
> After merging the slave-dma tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
Hi Stephen,

I rebased the tree last night and messed up at two places. Viresh helped to fix
one. I have pushed the fixed tree now. My limited build test looks fine now

--
~Vinod
