From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: linux-next: manual merge of the thermal-soc tree with Linus' tree
Date: Tue, 14 May 2019 07:15:33 -0700
Message-ID: <20190514141531.GA16968@localhost.localdomain>
References: <20190513104928.0265b40f@canb.auug.org.au>
 <20190514034409.GA5691@localhost.localdomain>
 <20190514144006.60df13bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190514144006.60df13bb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gal Pressman <galpress@amazon.com>, Jason Gunthorpe <jgg@mellanox.com>, Talel Shenhar <talel@amazon.com>
List-Id: linux-next.vger.kernel.org

Hey Stephen,

On Tue, May 14, 2019 at 02:40:06PM +1000, Stephen Rothwell wrote:
> Hi Eduardo,
> 
> On Mon, 13 May 2019 20:44:11 -0700 Eduardo Valentin <edubezval@gmail.com> wrote:
> >
> > Thanks for spotting this. I am re-doing the branch based off v5.1-rc7,
> > where the last conflict went in with my current queue.
> 
> Its really not worth the rebase.  Just fix the build problem and send it
> all to Linus.

Yeah, I think I was not super clear in my first email. I am about to
send the content of my branch to Linus.  This specific conflict was
because a change in MAINTAINERS went in before the change I have in it,
causing a conflict there. The rebase is simply to make it easier for him
to pull when I send the git pull.

> 
> -- 
> Cheers,
> Stephen Rothwell
