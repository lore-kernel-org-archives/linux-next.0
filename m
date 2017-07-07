From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2 0/2] Additions to default DMA coherent pool
Date: Fri, 7 Jul 2017 23:55:39 +1000
Message-ID: <20170707235539.073718ed@canb.auug.org.au>
References: <1499093475-29859-1-git-send-email-vitaly_kuzmichev@mentor.com>
        <1499433759-16397-1-git-send-email-vitaly_kuzmichev@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499433759-16397-1-git-send-email-vitaly_kuzmichev@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vitaly Kuzmichev <vitaly_kuzmichev@mentor.com>
Cc: gregkh@linuxfoundation.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Vitaly,

On Fri, 7 Jul 2017 16:22:39 +0300 Vitaly Kuzmichev <vitaly_kuzmichev@mentor.com> wrote:
>
> v2:
> Since linux-next now includes Vladimir Murzin's version of default DMA
> coherent pool [1] our version is not required now and even causes merge
> conflict. The difference between two versions is not really significant
> except one serious problem with CONFIG_DMA_CMA. Please see patch v2 1/2
> for details.
> So that I have rebased our work on linux-next/master branch, and sending
> this patchset with necessary additions for default DMA pool feature.
> 
> Patch v2 2/2 adds 'dmainfo' to ProcFS to show available DMA regions.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=93228b44c33a572cb36cec2dbed42e9bdbc88d79

This is now also in Linus' tree.  You should rebase your work on that
commit (or just Linus' tree), not linux-next.

-- 
Cheers,
Stephen Rothwell
