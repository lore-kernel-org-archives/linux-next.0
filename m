From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the powerpc tree
Date: Sun, 24 Feb 2019 22:48:57 +1100
Message-ID: <8736odl846.fsf@concordia.ellerman.id.au>
References: <20190224010511.74f25272@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190224010511.74f25272@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Commit
>
>   f68e7927212f ("Revert "powerpc/book3s32: Reorder _PAGE_XXX flags to simplify TLB handling"")
>
> is missing a Signed-off-by from its author and committer.
>
> Reverts are commits as well :-)

But do they need SOBs?

The DCO says:

By making a contribution to this project, I certify that:

        (a) The contribution was created in whole or in part by me and I
            have the right to submit it under the open source license
            indicated in the file; or

        (b) The contribution is based upon previous work that, to the best
            of my knowledge, is covered under an appropriate open source
            license and I have the right under that license to submit that
            work with modifications, whether created in whole or in part
            by me, under the same open source license (unless I am
            permitted to submit under a different license), as indicated
            in the file; or

        (c) The contribution was provided directly to me by some other
            person who certified (a), (b) or (c) and I have not modified
            it.

        (d) I understand and agree that this project and the contribution
            are public and that a record of the contribution (including all
            personal information I submit with it, including my sign-off) is
            maintained indefinitely and may be redistributed consistent with
            this project or the open source license(s) involved.


Only d) really applies to a revert, and as the maintainer I feel like d)
is kind of implied.

Anyway I'll try and remember to do it in future if that's The Rule ;)

cheers
