From: Jeff Layton <jlayton@redhat.com>
Subject: Re: [PATCH] cifs: Fix build warning in dns_resolve.c
Date: Tue, 16 Jun 2009 06:46:32 -0400
Message-ID: <20090616064632.1116226e@tlielax.poochiereds.net>
References: <4A3765B2.10006@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:49962 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752843AbZFPKqg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2009 06:46:36 -0400
In-Reply-To: <4A3765B2.10006@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Suresh Jayaraman <sjayaraman@suse.de>
Cc: Steve French <smfrench@gmail.com>, linux-next@vger.kernel.org, "linux-cifs-client@lists.samba.org" <linux-cifs-client@lists.samba.org>

On Tue, 16 Jun 2009 14:58:18 +0530
Suresh Jayaraman <sjayaraman@suse.de> wrote:

> Fix a build warning in dns_resolve.c.
> 
> fs/cifs/dns_resolve.c: In function 'is_ip':
> fs/cifs/dns_resolve.c:42: warning: passing argument 1 of 'cifs_convert_address' discards qualifiers from pointer target type
> 
> Signed-off-by: Suresh Jayaraman <sjayaraman@suse.de>
> ---
>  fs/cifs/cifsproto.h |    2 +-
>  fs/cifs/netmisc.c   |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/cifs/cifsproto.h b/fs/cifs/cifsproto.h
> index c419416..53267a3 100644
> --- a/fs/cifs/cifsproto.h
> +++ b/fs/cifs/cifsproto.h
> @@ -74,7 +74,7 @@ extern unsigned int smbCalcSize(struct smb_hdr *ptr);
>  extern unsigned int smbCalcSize_LE(struct smb_hdr *ptr);
>  extern int decode_negTokenInit(unsigned char *security_blob, int length,
>  			enum securityEnum *secType);
> -extern int cifs_convert_address(char *src, void *dst);
> +extern int cifs_convert_address(const char *src, void *dst);
>  extern int map_smb_to_linux_error(struct smb_hdr *smb, int logErr);
>  extern void header_assemble(struct smb_hdr *, char /* command */ ,
>  			    const struct cifsTconInfo *, int /* length of
> diff --git a/fs/cifs/netmisc.c b/fs/cifs/netmisc.c
> index f9a54da..390ef00 100644
> --- a/fs/cifs/netmisc.c
> +++ b/fs/cifs/netmisc.c
> @@ -163,7 +163,7 @@ cifs_inet_pton(const int address_family, const char *cp, void *dst)
>   * Returns 0 on failure.
>   */
>  int
> -cifs_convert_address(char *src, void *dst)
> +cifs_convert_address(const char *src, void *dst)
>  {
>  	struct sockaddr_in *s4 = (struct sockaddr_in *) dst;
>  	struct sockaddr_in6 *s6 = (struct sockaddr_in6 *) dst;

I'd prefer that that warning get fixed by having Steve commit the last
patch in that series. That patch changes cifs_convert_address to
temporarily add termination to the middle of the src string so the
"const" qualifier will have to go. Until then though, the warning is
harmless since this version of cifs_convert_address doesn't actually
change src.

-- 
Jeff Layton <jlayton@redhat.com>
