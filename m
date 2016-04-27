From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Subject: Re: linux-next: manual merge of the staging tree with the staging.current tree
Date: Wed, 27 Apr 2016 13:37:35 +0100
Message-ID: <E2CBCFEF-B21C-4B81-8DA8-25F3A1824440@jic23.retrosnub.co.uk>
References: <20160427145400.7bf1e6bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160427145400.7bf1e6bb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gregor Boirie <gregor.boirie@parrot.com>, Jonathan Cameron <jic23@kernel.org>, Richard Leitner <dev@g0hl1n.net>
List-Id: linux-next.vger.kernel.org



On 27 April 2016 05:54:00 BST, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>Hi Greg,
>
>Today's linux-next merge of the staging tree got a conflict in:
>
>  drivers/iio/magnetometer/ak8975.c
>
>between commit:
>
>  05be8d4101d9 ("iio: ak8975: fix maybe-uninitialized warning")
>
>from the staging.current tree and commit:
>
>  97eacb9166f4 ("iio:ak8975: add mounting matrix support")
>
>from the staging tree.
>
>I fixed it up (see below) and can carry the fix as necessary. This
>is now fixed as far as linux-next is concerned, but any non trivial
>conflicts should be mentioned to your upstream maintainer when your
>tree
>is submitted for merging.  You may also want to consider cooperating
>with the maintainer of the conflicting tree to minimise any
>particularly
>complex conflicts.

Hi Stephen,

Sorry, I clearly failed to check my own trees didn't clash before sending the pull to Greg.

Fix looks good, thanks

Jonathan

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
