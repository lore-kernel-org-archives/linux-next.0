From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: manual merge of the staging tree with the v4l-dvb
 tree
Date: Tue, 27 Sep 2011 16:14:48 -0400
Message-ID: <4E822EB8.5030901@windriver.com>
References: <20110927161055.05bbb0586fffbfbb2307f30b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110927161055.05bbb0586fffbfbb2307f30b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Igor M. Liplianin" <liplianin@netup.ru>, Mauro Carvalho Chehab <mchehab@redhat.com>
List-Id: linux-next.vger.kernel.org

On 11-09-27 02:10 AM, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/misc/altera-stapl/altera.c between commit cff4fa8415a3 ("[media]
> altera-stapl: it is time to move out from staging") from the v4l-dvb tree
> and commit 99c978529a40 ("staging: Add module.h to drivers/staging
> users") from the staging tree.

Hey Greg/Stephen,

So that I could revalidate the module.h stuff with randconfig builds,
I've taken the above staging commit and re-applied it to the module.h
tree -- I'm pretty sure git will see it as the same commit and just
move on with no complaints, but just a heads up for Stephen in case.

This won't happen until Stephen takes the module.h from one of our
internal servers as a temporary measure while kernel.org is down.
I'll be sending that information to linux-next and Stephen later
today.

Paul.

> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.
> 
> Mauro, you could, of course, apply Paul's patch to the file in its new
> location.
