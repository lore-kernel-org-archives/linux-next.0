From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the pm tree with the s390 tree
Date: Tue, 25 Oct 2011 10:44:40 +0200
Message-ID: <201110251044.40354.rjw@sisk.pl>
References: <20111025182025.d57f82a57ceaa8fae7cc5127@canb.auug.org.au> <201110251039.46327.rjw@sisk.pl> <20111025104005.733cd419@de.ibm.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111025104005.733cd419@de.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>
List-Id: linux-next.vger.kernel.org

On Tuesday, October 25, 2011, Martin Schwidefsky wrote:
> On Tue, 25 Oct 2011 10:39:46 +0200
> "Rafael J. Wysocki" <rjw@sisk.pl> wrote:
> 
> > On Tuesday, October 25, 2011, Stephen Rothwell wrote:
> > > Hi Rafael,
> > > 
> > > Today's linux-next merge of the pm tree got a conflict in
> > > arch/s390/kernel/suspend.c between commit 4de2166b1804 ("[S390] sparse:
> > > fix sparse warnings about missing prototypes") from the s390 tree and
> > > commit 85055dd805f0 ("PM / Hibernate: Include storage keys in hibernation
> > > image on s390") from the pm tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary.
> > 
> > The fix looks correct to me, so please carry it going forward (unless
> > Martin decides to pull it into his tree).
> 
> I could add the git commit 85055dd805f0 from the pm tree to git390 and fix
> the merge conflict in the new sparse patch. Dunno if it is worthwhile.

Not really.  I think the conflict is easy enough to handle at merge time.

Thanks,
Rafael
