From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: the selinux tree needs cleaning up
Date: Wed, 18 Jun 2014 14:26:27 -0400
Message-ID: <1446656.4HCLD295vV@sifl>
References: <20140618084046.1bce12cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140618084046.1bce12cc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wednesday, June 18, 2014 08:40:46 AM Stephen Rothwell wrote:
> Hi Paul,
> 
> The selinux tree (git://git.infradead.org/users/pcmoore/selinux#next)
> contains some commits going back to January and also has merges of
> v3.13, v3.14 and v3.15 in it.  If you rebase that tree onto v3.16-rc1,
> you find that it has onlt 2 unique commits (the most recent 2) which
> means that the others were merged upstream after being rewritten.  :-(

Without going through each of the differences between the SELinux tree and 
what is in Linus' tree in this email, I can assure you there is nothing 
nefarious going on here, just some differences in tree management between 
James' Linux Security tree and the SELinux tree which resulted in some 
backports and other mess.  The good news is that James' and the rest of us 
under the Linux Security tree have now established a protocol moving forward 
which should avoid these nasties.

So, back to your concerns - what do you want to see in linux-next?  My 
practice for the SELinux #next branch has been to apply patches on top of the 
latest "major" release from Linus, e.g. 3.15, and when a new major release is 
made I merge it into #next and restart the process.  I generally send James' a 
pull request in the -rc6/7 timeframe using the #next branch.  While this has 
resulted in some ugliness (see above comments) it keeps the SELinux #next 
branch steady so others can pull from it without major problems.

Does this approach not work for you and linux-next?

-- 
paul moore
www.paul-moore.com
