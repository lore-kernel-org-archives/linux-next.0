From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: randconfig build error with next-20150123, in security/smack/smack_netfilter.c
Date: Fri, 23 Jan 2015 08:55:14 -0800
Message-ID: <54C27CF2.8060609@schaufler-ca.com>
References: <CA+r1Zhgenmrjo=1hXf5uBWu9H_MgpYNJbK-xVHq7hekrUxs_pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <CA+r1Zhgenmrjo=1hXf5uBWu9H_MgpYNJbK-xVHq7hekrUxs_pA@mail.gmail.com>
Sender: linux-security-module-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, james.l.morris@oracle.com, serge@hallyn.com, linux-security-module <linux-security-module@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 1/23/2015 8:20 AM, Jim Davis wrote:
> Building with the attached random configuration file,
>
> security/smack/smack_netfilter.c: In function =91smack_ipv4_output=92=
:
> security/smack/smack_netfilter.c:55:6: error: =91struct sk_buff=92 ha=
s no
> member named =91secmark=92
>    skb->secmark =3D skp->smk_secid;
>       ^
> make[2]: *** [security/smack/smack_netfilter.o] Error 1

Yup. Problem in security/smack/Makefile. Patch imminent.=20

--
To unsubscribe from this list: send the line "unsubscribe linux-securit=
y-module" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
