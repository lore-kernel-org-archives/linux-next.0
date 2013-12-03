From: Richard Weinberger <richard@nod.at>
Subject: Re: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Tue, 03 Dec 2013 08:16:04 +0100
Message-ID: <1552053.4Szip5nVtU@sandpuppy>
References: <20131203125219.97839b4335adffdeb3ef7160@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131203125219.97839b4335adffdeb3ef7160@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Andrew,

Am Dienstag, 3. Dezember 2013, 12:52:19 schrieb Stephen Rothwell:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in
> arch/um/kernel/sysrq.c between commit 8ed12fcc194d ("um: Rename
> print_stack_trace to do_stack_trace") from Linus' tree and commit
> ce89e7878311 ("arch/um/kernel/sysrq.c: rename print_stack_trace()") from
> the akpm-current tree.
> 
> I fixed it up (I used the version fro, Linus' tree) and can carry the fix
> as necessary (no action is required).

How comes that this patch landed in your tree, I didn't receive a mail from 
your bot?
Anyway, it found it's way into Linus' tree using my UML tree.

Thanks,
//richard
