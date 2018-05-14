From: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the bpf tree
Date: Mon, 14 May 2018 13:41:40 -0700
Message-ID: <20180514134140.0c468174@cakuba>
References: <20180514115700.0faadd6f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180514115700.0faadd6f@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 14 May 2018 11:57:00 +1000, Stephen Rothwell wrote:
> diff --cc tools/lib/bpf/libbpf.c
> index 8da4eeb101a6,df54c4c9e48a..000000000000
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@@ -2163,9 -2193,12 +2193,12 @@@ int bpf_prog_load_xattr(const struct bp
>   
>   	if (!attr)
>   		return -EINVAL;
> + 	if (!attr->file)
> + 		return -EINVAL;
>   
> - 	obj = bpf_object__open(attr->file);
> + 	obj = __bpf_object__open(attr->file, NULL, 0,
> + 				 bpf_prog_type__needs_kver(attr->prog_type));
>  -	if (IS_ERR(obj))
>  +	if (IS_ERR_OR_NULL(obj))
>   		return -ENOENT;

This is okay, thanks.  The OR_NULL is unnecessary just using the
bpf-next code is a better merge IMO.
