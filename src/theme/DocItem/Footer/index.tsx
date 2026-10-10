import React from 'react';
import Footer from '@theme-original/DocItem/Footer';
import type {WrapperProps} from '@docusaurus/types';
import type FooterType from '@theme/DocItem/Footer';

type Props = WrapperProps<typeof FooterType>;

const discord = 'https://discord.gg/tuWyFzj3Nj';
const issues = 'https://github.com/ChurchCRM/CRM/issues/new/choose';

export default function FooterWrapper(props: Props): React.JSX.Element {
  return (
    <>
      <Footer {...props} />
      <p>
        Can&apos;t find what you need? Ask in{' '}
        <a href={discord}>Discord</a>, or{' '}
        <a href={issues}>open an issue</a> on the ChurchCRM repository.
      </p>
    </>
  );
}
