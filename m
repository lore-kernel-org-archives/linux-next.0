From: Will Drewry <wad@chromium.org>
Subject: Re: linux-next: build warning after merge of the final tree (security
 tree related)
Date: Tue, 17 Apr 2012 11:06:48 -0500
Message-ID: <CABqD9hbi=2SsybyirtCPivUerrx6Uohu5GJLc_gaUcTiT8h-kg@mail.gmail.com>
References: <20120417141023.40aefc2ff17c29b2edf51762@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120417141023.40aefc2ff17c29b2edf51762@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Eric Paris <eparis@redhat.com>, Serge Hallyn <serge.hallyn@canonical.com>
List-Id: linux-next.vger.kernel.org

Doh - thanks! I'll figure out the right way to silence these warnings
in this config case and post the patch against James's tree.

Thanks!

On Mon, Apr 16, 2012 at 11:10 PM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> Hi all,
>
> After merging the final tree, today's linux-next build (sparc64 defco=
nfig)
> produced this warning:
>
> kernel/seccomp.c: In function '__secure_computing':
> kernel/seccomp.c:445:1: warning: label 'skip' defined but not used [-=
Wunused-label]
> kernel/seccomp.c:381:6: warning: unused variable 'data' [-Wunused-var=
iable]
> kernel/seccomp.c:380:6: warning: unused variable 'ret' [-Wunused-vari=
able]
>
> Introduced by commit acf3b2c71ed2 ("seccomp: add SECCOMP_RET_ERRNO").
> This build has CONFIG_SECCOMP_FILTER turned off.
>
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
