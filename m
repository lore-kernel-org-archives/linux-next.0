From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vhost tree
Date: Wed, 7 Feb 2018 15:30:07 +1100
Message-ID: <20180207153007.4364d607@canb.auug.org.au>
References: <20180207130423.4f9c1ad0@canb.auug.org.au>
        <20180207135441.0d99ebdb@canb.auug.org.au>
        <20180207045702-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180207045702-mutt-send-email-mst@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Wang <wei.w.wang@intel.com>, Liang Li <liang.z.li@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Michael,

On Wed, 7 Feb 2018 04:57:42 +0200 "Michael S. Tsirkin" <mst@redhat.com> wrote:
>
> On Wed, Feb 07, 2018 at 01:54:41PM +1100, Stephen Rothwell wrote:
> > 
> > On Wed, 7 Feb 2018 13:04:23 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
> > >
> > > I have used the vhost tree from next-20180206 for today.  
> 
> That's
> commit d25cc43c6775bff6b8e3dad97c747954b805e421
>     vhost: don't hold onto file pointer for VHOST_SET_LOG_FD
> 
> Right?

Correct.

-- 
Cheers,
Stephen Rothwell
