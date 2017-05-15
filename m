From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Mon, 15 May 2017 15:07:09 +1000
Message-ID: <20170515150709.27aba242@canb.auug.org.au>
References: <20170515115602.30e05989@canb.auug.org.au>
        <5919284A.4050202@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5919284A.4050202@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xunlei Pang <xpang@redhat.com>
Cc: xlpang@redhat.com, Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Xunlei,

On Mon, 15 May 2017 12:02:18 +0800 Xunlei Pang <xpang@redhat.com> wrote:
>
> The following patch will fix it, do you want to me to send it out separately? or help merge it into
> fc7d2b44367f ("powerpc/fadump: use the correct VMCOREINFO_NOTE_SIZE for phdr") directly?

Andrew normally takes these as separate patches and then merges them
before sending them on.

-- 
Cheers,
Stephen Rothwell
