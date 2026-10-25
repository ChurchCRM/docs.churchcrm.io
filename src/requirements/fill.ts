import requirements from '../../requirements.json';

const TOKEN = /@@(\w+)@@/g;

export function fillRequirements(markdown: string): string {
  return markdown.replace(TOKEN, (token, key: string) => {
    const value = (requirements as Record<string, string>)[key];
    if (value === undefined) {
      throw new Error(`Unknown requirement ${token}. Add "${key}" to requirements.json.`);
    }
    return value;
  });
}
