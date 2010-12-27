From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kconfig: fix warning
Date: Mon, 27 Dec 2010 21:53:35 +0100
Message-ID: <20101227205335.GF21436@pobox.suse.cz>
References: <20101223110048.09ff9f40.sfr@canb.auug.org.au> <1293092716-15765-1-git-send-email-lacombar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1293092716-15765-1-git-send-email-lacombar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, Dec 23, 2010 at 03:25:16AM -0500, Arnaud Lacombe wrote:
> In file included from scripts/kconfig/zconf.tab.c:2502:
> scripts/kconfig/expr.c:1033: warning: no previous prototype for 'expr_simplify_unmet_dep'
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/expr.h |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Applied to kbuild-2.6.git#kconfig, thanks.

Michal
> 
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index 218991b..79ab6e7 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -206,6 +206,7 @@ struct expr *expr_extract_eq_and(struct expr **ep1, struct expr **ep2);
>  struct expr *expr_extract_eq_or(struct expr **ep1, struct expr **ep2);
>  void expr_extract_eq(enum expr_type type, struct expr **ep, struct expr **ep1, struct expr **ep2);
>  struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symbol *sym);
> +struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2);
>  
>  void expr_fprint(struct expr *e, FILE *out);
>  struct gstr; /* forward */
> -- 
> 1.7.3.3
> 
