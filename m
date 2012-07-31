From: Michel Lespinasse <walken@google.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Tue, 31 Jul 2012 03:34:12 -0700
Message-ID: <CANN689FGMfL_Y3afhYbmSdvQH4tU+7CErODb=NoqAZnmoZEa3w@mail.gmail.com>
References: <20120731144054.59b0a6da6d071ea1bc061db0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120731144054.59b0a6da6d071ea1bc061db0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sage Weil <sage@inktank.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jul 30, 2012 at 9:40 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Andrew,
>
> After merging the akpm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> net/ceph/osd_client.c: In function 'ceph_osdc_alloc_request':
> net/ceph/osd_client.c:216:2: error: implicit declaration of function 'rb_init_node' [-Werror=implicit-function-declaration]
>
> Caused by commit 753b960e52b7 ("rbtree: empty nodes have no color") from
> the akpm tree interacting with commit cd43045c2de6 ("libceph: initialize
> rb, list nodes in ceph_osd_request") from the ceph tree.
>
> I added the following merge fix patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 31 Jul 2012 14:37:35 +1000
> Subject: [PATCH] libceph: remove rb_node initialisation
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reviewed-by: Michel Lespinasse <walken@google.com>

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.
