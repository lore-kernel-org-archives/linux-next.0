From: "=?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?=" <fweisbec@gmail.com>
Subject: Re: linux-next: manual merge of the ftrace tree
Date: Thu, 11 Dec 2008 02:23:57 +0100
Message-ID: <c62985530812101723u66dd1662x279ff15fa741e8e5@mail.gmail.com>
References: <20081211114154.5d420ff5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.25]:15483 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753704AbYLKBX6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Dec 2008 20:23:58 -0500
Received: by qw-out-2122.google.com with SMTP id 3so224311qwe.37
        for <linux-next@vger.kernel.org>; Wed, 10 Dec 2008 17:23:57 -0800 (PST)
In-Reply-To: <20081211114154.5d420ff5.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Hugh Dickins <hugh@veritas.com>, Steven Rostedt <rostedt@goodmis.org>

Hi Stephen,

2008/12/11 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi all,
>
> Today's linux-next merge of the ftrace tree got a conflict in
> include/linux/ftrace.h between commit
> 9c24624727f6d6c460e45762a408ca5f5b9b8ef2 ("KSYM_SYMBOL_LEN fixes") from
> Linus' tree and commit 3f5ec13696fd4a33bde42f385406cbb1d3cc96fd
> ("tracing/fastboot: move boot tracer structs and funcs into their own
> header") from the ftrace tree.
>
> The latter moved some code that the former fixed.  I fixed it up as best
> I could (see below - I used the ftrace tree version of
> include/linux/ftrace.h), but it should be checked and a merge with Linus'
> tree done to resolve this conflict.
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>
> diff --git a/include/trace/boot.h b/include/trace/boot.h
> index 6b54537..3ec58b4 100644
> --- a/include/trace/boot.h
> +++ b/include/trace/boot.h
> @@ -9,7 +9,7 @@
>  */
>  struct boot_trace_call {
>        pid_t                   caller;
> -       char                    func[KSYM_NAME_LEN];
> +       char                    func[KSYM_SYMBOL_LEN];
>  };
>
>  /*
> @@ -17,7 +17,7 @@ struct boot_trace_call {
>  * while it returns.
>  */
>  struct boot_trace_ret {
> -       char                    func[KSYM_NAME_LEN];
> +       char                    func[KSYM_SYMBOL_LEN];
>        int                             result;
>        unsigned long long      duration;               /* nsecs */
>  };
>

Yes that's the right fix. The headers for the boot tracer have moved
for 2.6.29 merge window and the fix
should follow this move. If you agree, I will submit your patch to
latest -tip with the right "from " and
"signed-off-by" tags....
