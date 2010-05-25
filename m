From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: manual merge of the ext3 tree with Linus' tree
Date: Tue, 25 May 2010 23:55:52 +0200
Message-ID: <20100525215552.GA12633@quack.suse.cz>
References: <20100522154532.bc0f8008.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100522154532.bc0f8008.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jan Kara <jack@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>
List-Id: linux-next.vger.kernel.org

  Hi Stephen,

On Sat 22-05-10 15:45:32, Stephen Rothwell wrote:
> Today's linux-next merge of the ext3 tree got a conflict in fs/super.c
> between commits b20bd1a5e78af267dc4b6e1ffed48d5d776302c5 ("get rid of
> S_BIAS"), 1712ac8fda7d8bc4dc921f5777b7423aacad7263 ("Saner locking around
> deactivate_super()") and e1e46bf1866317d4f86f66bf18d3f07317d9f9ee ("Trim
> includes in fs/super.c") from Linus' tree and commits
> c3134141c78d5ea233a08b703b553e70cfb5c585 ("quota: move unmount handling
> into the filesystem") and cdb89ca659f5a39edf88f3c55e545ea3347533d1
> ("quota: explicitly set ->dq_op and ->s_qcop") from the ext3 tree.
  Thanks! I've now rebased for_next branch on recent Linus's tree and
so this conflict should go away.

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
