From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: linux-next: manual merge of the i7core_edac tree with Linus'
 tree
Date: Tue, 13 Oct 2009 07:50:36 -0400 (EDT)
Message-ID: <1209036982.100421255434636304.JavaMail.root@zmail05.collab.prod.int.phx2.redhat.com>
References: <20091012142328.710881fe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759565AbZJMLvM@vger.kernel.org>
In-Reply-To: <20091012142328.710881fe.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>
List-Id: linux-next.vger.kernel.org


----- "Stephen Rothwell" <sfr@canb.auug.org.au> escreveu:

> Hi Mauro,
> 
> Today's linux-next merge of the i7core_edac tree got a conflict in
> arch/x86/kernel/cpu/mcheck/mce.c between commit
> f436f8bb73138bc74eb1c6527723e00988ad8a8a ("x86: EDAC: MCE: Fix MCE
> decoding callback logic") from Linus' tree and commit
> 699a7dbe1ffdf4b25c1475e45590b181c3e23087 ("edac_mce: Add an interface
> driver to report mce errors via edac") from the i7core_edac tree.
> 
> I don't know how to resolve these two commits so I have dropped the
> i7core_edac tree for today.

Thanks for letting me know. I've rebased it fixing the merge conflict. For now,
I just removed the call to edac_mce_parse() for Uncorrected Errors, since I'll
eventually replace that part of the code with something better.

You should now be able to merge it without merging conflicts.

Cheers,
Mauro.
