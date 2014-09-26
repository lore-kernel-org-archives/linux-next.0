From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next tree addition request -- doc.git
Date: Fri, 26 Sep 2014 12:41:59 +0200
Message-ID: <CA+icZUVi-FWM+6kK5PsK=o-RLO7OCcjA8N1Kwr3cc44j8_d37A@mail.gmail.com>
References: <alpine.LNX.2.00.1409261132330.22196@pobox.suse.cz>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1409261132330.22196@pobox.suse.cz>
Sender: linux-doc-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-doc@vger.kernel.org
List-Id: linux-next.vger.kernel.org

T: git g

On Fri, Sep 26, 2014 at 11:37 AM, Jiri Kosina <jkosina@suse.cz> wrote:
> Hi Stephen,
>
> as a followup to Randy stepping down as a documentation maintainer [1],
> could you please add
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/jikos/doc.git#for-next
>
> to the pile that gets pulled into linux-next?
>
> Thanks.
>
> [1] d671e42457e1fef70ad0df07084207078633a9e8
>

I guess you want that in [1] and MAINTAINERS file...

[ MAINTAINERS ]
...
DOCUMENTATION
M: Jiri Kosina <jkosina@suse.cz>
L: linux-doc@vger.kernel.org
T: git git://git.kernel.org/pub/scm/linux/kernel/git/jikos/doc.git
S: Maintained
F: Documentation/
X: Documentation/ABI/

- Sedat -

[1] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Next/Trees

> --
> Jiri Kosina
> SUSE Labs
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
