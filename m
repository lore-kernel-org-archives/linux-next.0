From: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: linux-next: manual merge of the audit tree with Linus' tree
Date: Wed, 18 Jan 2017 23:16:00 -0500
Message-ID: <20170119041600.GA3087@madcap2.tricolour.ca>
References: <20170119135130.739d4f7b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-audit-bounces@redhat.com>
Content-Disposition: inline
In-Reply-To: <20170119135130.739d4f7b@canb.auug.org.au>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 2017-01-19 13:51, Stephen Rothwell wrote:
> Hi Paul,

Hi Stephen,

> Today's linux-next merge of the audit tree got a conflict in:
> 
>   include/uapi/linux/audit.h
> 
> between commits:
> 
>   7ff89ac608d9 ("audit: add exclude filter extension to feature bitmap")
>   dcdaa2f9480c ("Merge branch 'stable-4.10' of git://git.infradead.org/users/pcmoore/audit")
> 
> from Linus' tree and commit:
> 
>   92c82e8a322b ("audit: add feature audit_lost reset")
> 
> from the audit tree.

This merge conflict was expected.

Your fix below looks as expected.

Thanks!  Sorry for the trouble.

> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc include/uapi/linux/audit.h
> index 1c107cb1c83f,3f24110ae63c..000000000000
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@@ -330,13 -331,14 +331,16 @@@ enum 
>   #define AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT	0x00000001
>   #define AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME	0x00000002
>   #define AUDIT_FEATURE_BITMAP_EXECUTABLE_PATH	0x00000004
>  +#define AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND	0x00000008
>   #define AUDIT_FEATURE_BITMAP_SESSIONID_FILTER	0x00000010
> + #define AUDIT_FEATURE_BITMAP_LOST_RESET		0x00000020
> + 
>   #define AUDIT_FEATURE_BITMAP_ALL (AUDIT_FEATURE_BITMAP_BACKLOG_LIMIT | \
>   				  AUDIT_FEATURE_BITMAP_BACKLOG_WAIT_TIME | \
>   				  AUDIT_FEATURE_BITMAP_EXECUTABLE_PATH | \
>  +				  AUDIT_FEATURE_BITMAP_EXCLUDE_EXTEND | \
> - 				  AUDIT_FEATURE_BITMAP_SESSIONID_FILTER)
> + 				  AUDIT_FEATURE_BITMAP_SESSIONID_FILTER | \
> + 				  AUDIT_FEATURE_BITMAP_LOST_RESET)
>   
>   /* deprecated: AUDIT_VERSION_* */
>   #define AUDIT_VERSION_LATEST 		AUDIT_FEATURE_BITMAP_ALL

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Kernel Security Engineering, Base Operating Systems, Red Hat
Remote, Ottawa, Canada
Voice: +1.647.777.2635, Internal: (81) 32635
