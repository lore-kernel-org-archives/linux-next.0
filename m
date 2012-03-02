From: Cong Wang <amwang@redhat.com>
Subject: Re: linux-next: manual merge of the kmap_atomic tree with the
 staging tree
Date: Fri, 02 Mar 2012 13:51:30 +0800
Message-ID: <1330667490.2539.12.camel@cr0>
References: <20120301170731.e14fb63e606a8e67b0cb919a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120301170731.e14fb63e606a8e67b0cb919a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, ". Seth Jennings" <sjenning@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Thu, 2012-03-01 at 17:07 +1100, Stephen Rothwell wrote:
> Hi Cong,
> 
> Today's linux-next merge of the kmap_atomic tree got a conflict in
> drivers/staging/zcache/zcache-main.c between various commits from the
> staging tree and commit 1edbcaee3bbe ("zcache: remove the second argument
> of k[un]map_atomic()") from the kmap_atomic tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Hi, Stephen,

Sorry for the delay, it looks correct to me.

Thanks!
