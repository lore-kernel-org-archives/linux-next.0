From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: unusual update of the security tree
Date: Tue, 27 Nov 2012 15:30:31 -0800
Message-ID: <CA+55aFxxq9a8ZQfcMC1=cKO90zu6hqvfJipt1t0tJy1ypYw30w@mail.gmail.com>
References: <20121128101635.d5e864dffc4252ef9d5e1664@canb.auug.org.au> <20121128102800.97a1a4d895f0bfaf72b80272@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121128102800.97a1a4d895f0bfaf72b80272@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Casey Schaufler <casey@schaufler-ca.com>
List-Id: linux-next.vger.kernel.org

On Tue, Nov 27, 2012 at 3:28 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> If that is what happened, it may be worth always using the --no-ff flag
> to git merge/pull to make sure that the top commit on your tree always
> has you as the committer (and maybe SOB).
>
> Linus, does that make sense in general for maintainers?

No. That just hides the real problem - back-merges of random points in history.

Don't do them, people. EVER.

              Linus
