From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: missing merge fix for the access_once tree
Date: Mon, 22 Dec 2014 20:12:22 -0800
Message-ID: <CA+55aFxjeunxnfc8L1r=GWCBUf5uU=bcnDeu6VygMbsCxVgB0Q@mail.gmail.com>
References: <20141223131749.78087632@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141223131749.78087632@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 22, 2014 at 6:17 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> I have been carrying this merge fix patch for some time.  It should
> have gone into the merge of the access_once tree.

No, you had a different tree that got merged into linux-next, that
made it an error to do ACCESS_ONCE() on a structure.

The thing I merged didn't actually have that final commit, exactly so
that things wouldn't break from missing conversions.

So that patch isn't wrong, but it also isn't exactly a required fix
until the next merge window..

                      Linus
