From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the ftrace tree
Date: Fri, 12 Dec 2008 10:23:08 +0100
Message-ID: <20081212092308.GI25106@elte.hu>
References: <20081211114154.5d420ff5.sfr@canb.auug.org.au> <c62985530812101723u66dd1662x279ff15fa741e8e5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:55085 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758172AbYLLJXW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Dec 2008 04:23:22 -0500
Content-Disposition: inline
In-Reply-To: <c62985530812101723u66dd1662x279ff15fa741e8e5@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?iso-8859-1?Q?Fr=E9d=E9ric?= Weisbecker <fweisbec@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Hugh Dickins <hugh@veritas.com>, Steven Rostedt <rostedt@goodmis.org>


* Fr=E9d=E9ric Weisbecker <fweisbec@gmail.com> wrote:

> >  struct boot_trace_ret {
> > -       char                    func[KSYM_NAME_LEN];
> > +       char                    func[KSYM_SYMBOL_LEN];
> >        int                             result;
> >        unsigned long long      duration;               /* nsecs */
> >  };
> >
>=20
> Yes that's the right fix. The headers for the boot tracer have moved=20
> for 2.6.29 merge window and the fix should follow this move. If you=20
> agree, I will submit your patch to latest -tip with the right "from "=
=20
> and "signed-off-by" tags....

i missed that bit indeed - so i've picked up your patch, thanks.

	Ingo
