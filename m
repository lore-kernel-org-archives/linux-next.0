From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bad commit in the xen-tip tree
Date: Fri, 9 Jun 2017 07:59:10 +1000
Message-ID: <20170609075910.66c300b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

The current top commit of the xen-tip tree

  9e925824eccd ("xen: avoid type warning in xchg_xen_ulong")

has no Signed-off-by for its committer.

-- 
Cheers,
Stephen Rothwell
