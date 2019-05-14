From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: build failure after merge of the ecryptfs tree
Date: Tue, 14 May 2019 13:16:37 +0900
Message-ID: <CAK7LNAS-KDO0Cuq34T5MZvJjxZ-A3HaG3qnJi3v4P9xS=4fRQA@mail.gmail.com>
References: <20190514100910.6996d2f5@canb.auug.org.au> <CAK7LNAT_aJ4-abaNXe5VwvAYa2TOprjFL-vcUc730EDwHq80kw@mail.gmail.com>
 <20190514110334.424cf0be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514110334.424cf0be@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Tue, May 14, 2019 at 10:04 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Masahiro,
>
> Also, this:
>
> On Tue, 14 May 2019 09:40:53 +0900 Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >
> > > Mind you, I have no itdea why this file was begin rebuilt, the merge
> > > only touched these files:
> > >
> > > fs/ecryptfs/crypto.c
> > > fs/ecryptfs/keystore.c
>
> Its a bit annoying that the module was even being looked at given
> nothing it files depend upon had been modified.


If you are talking about the rebuild of
.tmp_versions/*.mod files,
yes, they are cleaned up every time.

# Create temporary dir for module support files
# clean it up only when building all modules
cmd_crmodverdir = $(Q)mkdir -p $(MODVERDIR) \
                  $(if $(KBUILD_MODULES),; rm -f $(MODVERDIR)/*)


I think the reason is that
we want to make sure stale modules are not remaining
when CONFIG_MY_DRIVER=m is turned into CONFIG_MY_DRIVER=n


Rebuilding .mod files is not expensive.

I think this behavior can be improved, but
that is how it has been working for a long time.


--
Best Regards
Masahiro Yamada
